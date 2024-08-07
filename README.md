
# This is to test a worker connection to Temporal cloud

1. bundle install 
2. add client_key, client_cert, root_cert to  `/certs` folder
3. start worker ` bundle exec ruby lib/temporal_worker.rb` 

I get this error currently: 
```E, [2024-08-07T18:53:14.604189 #24875] ERROR -- temporal_client: Unable to poll Workflow task queue {"namespace":"testing-sdk.gsllh","task_queue":"default","error":"#<GRPC::Unavailable: 14:errors resolving testing-sdk.gsllh.tmprl.cloud:7233:7233: [field:hostname lookup error:address lookup failed for testing-sdk.gsllh.tmprl.cloud:7233:7233: Domain name not found]. debug_error_string:{UNKNOWN:Error received from peer  {grpc_message:\"errors resolving testing-sdk.gsllh.tmprl.cloud:7233:7233: [field:hostname lookup error:address lookup failed for testing-sdk.gsllh.tmprl.cloud:7233:7233: Domain name not found]\", grpc_```

I have tested my certs using The Python SDK from Temporal and can get a workflow to trigger


If you are using this for your your own temporal cloud account, you will need to go to the `lib/temporal_worker.rb` and change the namespace, host 