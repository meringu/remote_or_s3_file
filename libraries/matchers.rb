if defined?(ChefSpec)
  ChefSpec.define_matcher :remote_or_s3_file

  #
  # Used to verify whether a remote_or_s3_file resource has been defined
  #
  # @example To check if a file that is available either via S3 or a url will be created
  #   expect(chef_run).to create_remote_or_s3_file('foo')
  #
  # @param [String] resource_name
  #   the resource name
  #
  # @return [ChefSpec::Matchers::ResourceMatcher]
  #
  def create_remote_or_s3_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:remote_or_s3_file, :create, resource_name)
  end

  #
  # Used to verify whether a remote_or_s3_file resource has been defined
  #
  # @example To check if a file that is available either via S3 or a url will be created if missing
  #   expect(chef_run).to create_if_missing_remote_or_s3_file('foo')
  #
  # @param [String] resource_name
  #   the resource name
  #
  # @return [ChefSpec::Matchers::ResourceMatcher]
  #
  def create_if_missing_remote_or_s3_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:remote_or_s3_file, :create_if_missing, resource_name)
  end

  #
  # Used to verify whether a remote_or_s3_file resource has been defined
  #
  # @example To check if a file that is available either via S3 or a url will be deleted
  #   expect(chef_run).to delete_remote_or_s3_file('foo')
  #
  # @param [String] resource_name
  #   the resource name
  #
  # @return [ChefSpec::Matchers::ResourceMatcher]
  #
  def delete_remote_or_s3_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:remote_or_s3_file, :delete, resource_name)
  end

  #
  # Used to verify whether a remote_or_s3_file resource has been defined
  #
  # @example To check if a file that is available either via S3 or a url will be touched
  #   expect(chef_run).to touch_remote_or_s3_file('foo')
  #
  # @param [String] resource_name
  #   the resource name
  #
  # @return [ChefSpec::Matchers::ResourceMatcher]
  #
  def touch_remote_or_s3_file(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:remote_or_s3_file, :touch, resource_name)
  end

end
