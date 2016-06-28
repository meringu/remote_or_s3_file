# remote_or_s3_file

This cookbook provides the resource `remote_or_s3_file`.

The provider `remote_or_s3_file` acts just like `remote_file`, except when you
use an `s3://...` uri, then the `remote_or_s3_file` will act like the
`aws_s3_file` provider.

## Usage

Include the default recipe to ensure the aws-sdk is installed in Chef. Only
needed if you're using an `aws` cookbook version of less than 3.0.

```ruby
include_recipe 'remote_or_s3_file'
```

Then to download to a file from a non-S3 bucket

```ruby
remote_or_s3_file 'example.zip' do
  source 'http://example.com/example.zip'
end
```

Or from an S3 bucket

```ruby
remote_or_s3_file 'example.zip' do
  source 's3://example/example.zip'
end
```
