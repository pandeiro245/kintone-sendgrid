require 'sendgrid-ruby'
require 'dotenv'
require 'kintone'
require 'kintone_sync'

Dotenv.load('.env')

include SendGrid

from = Email.new(email: 'from@ruffnote.com')
subject = 'Hello World from the SendGrid Ruby Library!'
to = Email.new(email: 'to@mindia.jp')
content = Content.new(type: 'text/plain', value: 'Hello, Email!')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
