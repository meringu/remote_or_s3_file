use_inline_resources

def whyrun_supported?
  true
end

action :create do
  do_remote_or_s3_file(:create)
end

action :create_if_missing do
  do_remote_or_s3_file(:create_if_missing)
end

action :delete do
  do_remote_or_s3_file(:delete)
end

action :touch do
  do_remote_or_s3_file(:touch)
end

def s3_url?
  new_resource.source.start_with? 's3://'
end

def s3_components
  comps = new_resource.source.scan(%r{^s3://([^/]+)/(.*)$})
  Chef::Application.fatal!("Could not extract components from URI #{uri}") if comps.empty?
  comps.first
end

def s3_bucket
  s3_components[0]
end

def s3_prefix
  s3_components[1]
end

def common_attributes
  %i(
    owner
    group
    mode
    checksum
    backup
  )
end

def aws_s3_file_attributes
  %i(
    aws_access_key_id
    aws_secret_access_key
    aws_session_token
    region
  ).concat(common_attributes)
end

def remote_file_attributes
  %i(
    source
  ).concat(common_attributes)
end

def do_aws_s3_file(resource_action)
  aws_s3_file new_resource.path do
    bucket s3_bucket
    remote_path s3_prefix
    aws_s3_file_attributes.each do |attr|
      send(attr, new_resource.send(attr)) unless new_resource.send(attr).nil?
    end
    action resource_action
  end
end

def do_remote_file(resource_action)
  remote_file new_resource.path do
    remote_file_attributes.each do |attr|
      send(attr, new_resource.send(attr))
    end
    action resource_action
  end
end

def do_remote_or_s3_file(resource_action)
  if s3_url?
    do_aws_s3_file(resource_action)
  else
    do_remote_file(resource_action)
  end
end
