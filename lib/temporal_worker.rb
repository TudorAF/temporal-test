
#!/usr/bin/env ruby
# frozen_string_literal: true
require "temporal"

require "temporal/activity"
require "temporal/workflow"
require "temporal/worker"

client_key = File.read( "certs/temporal.key")
client_cert = File.read( "certs/temporal.pem")
root_cert = File.read("certs/ca.pem")

Temporal.configure do |config|
  config.host = "testing-sdk.gsllh.tmprl.cloud:7233"
  config.port = 7233
  config.namespace = "testing-sdk.gsllh"
  config.task_queue = "default"
  config.credentials = GRPC::Core::ChannelCredentials.new(
    nil,
    client_key,
    client_cert
  )
end

# Define a Hello World Activity
class HelloWorldActivity < Temporal::Activity
  def execute(name)
    "Hello, #{name}!"
  end
end

# Define a Hello World Workflow
class HelloWorldWorkflow < Temporal::Workflow
  def execute(name)
    result = HelloWorldActivity.execute(name)
    logger.info(result)
    result
  end
end

worker = Temporal::Worker.new

# Register workflows and activities
worker.register_workflow(HelloWorldWorkflow)
worker.register_activity(HelloWorldActivity)

worker.start
