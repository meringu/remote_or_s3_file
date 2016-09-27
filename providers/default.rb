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

def do_remote_or_s3_file(resource_action)
  if new_resource.source.start_with? 's3://'
    comps = new_resource.source.scan(%r{^s3://([^/]+)/(.*)$})
    Chef::Application.fatal!("Could not extract components from URI #{uri}") if comps.empty?
    bucket, path = comps.first
    aws_s3_file new_resource.path do
      bucket bucket
      remote_path path
      owner new_resource.owner unless new_resource.owner.nil?
      group new_resource.group unless new_resource.group.nil?
      mode new_resource.mode unless new_resource.mode.nil?
      checksum new_resource.checksum unless new_resource.backup.nil?
      backup new_resource.backup unless new_resource.backup.nil?
      aws_access_key_id new_resource.aws_access_key_id unless new_resource.aws_access_key_id.nil?
      aws_secret_access_key new_resource.aws_secret_access_key unless new_resource.aws_secret_access_key.nil?
      aws_session_token new_resource.aws_session_token unless new_resource.aws_session_token.nil?
      region new_resource.region unless new_resource.region.nil?
      action resource_action
    end
  else
    remote_file new_resource.path do
      source new_resource.source
      owner new_resource.owner
      group new_resource.group
      mode new_resource.mode
      checksum new_resource.checksum
      backup new_resource.backup
      action resource_action
    end
  end
end
