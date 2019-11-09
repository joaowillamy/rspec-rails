require 'httparty'
# require 'vcr'

describe 'HTTParty' do
  it 'content-type stubbing' do
    stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2")
      .to_return(status: 200, body: "", headers: { 'content-type': 'application/json'})

    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  it 'content-type vcr' do
    VCR.use_cassette('jsonplaceholder/posts') do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(/application\/json/)
     end
  end
  
  it 'vcr metadata- ignore param id',  vcr: { cassette_name: 'jsonplaceholder/posts',  match_requests_on: [:body] }  do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  it 'vcr - record modes',  vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes }  do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

end