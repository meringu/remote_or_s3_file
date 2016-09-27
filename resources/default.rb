actions :create, :create_if_missing, :delete, :nothing, :touch

default_action :create

attribute :path, kind_of: String, name_attribute: true
attribute :source, kind_of: String, required: true
attribute :owner, regex: Chef::Config[:user_valid_regex]
attribute :group, regex: Chef::Config[:group_valid_regex]
attribute :mode, kind_of: String
attribute :checksum, kind_of: String
attribute :backup, kind_of: [Integer, FalseClass], default: 5
attribute :aws_access_key_id, kind_of: String
attribute :aws_secret_access_key, kind_of: String
attribute :aws_session_token, kind_of: String
attribute :region, kind_of: String
