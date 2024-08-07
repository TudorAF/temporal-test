

module TemporalService
  def self.setup
    require "temporal"

    client_key = File.read( "certs/temporal.key")
    client_cert = File.read( "certs/temporal.pem")
    root_cert = File.read("certs/ca.pem")

    Temporal.configure do |config|
      config.host = "testing-sdk.gsllh.tmprl.cloud"
      config.port = 7233
      config.namespace = "testing-sdk.gsllh"
      config.task_queue = "default"
      config.credentials = GRPC::Core::ChannelCredentials.new(
        nil,
        client_key,
        client_cert
      )
    end
  end
end
