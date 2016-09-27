name             'remote_or_s3_file'
maintainer       'Henry Muru Paenga'
maintainer_email 'meringu@gmail.com'
license          'All rights reserved'
description      'Recource wrapper for remote_file and aws_s3_file'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.6'

depends          'aws'

source_url 'https://github.com/meringu/remote_or_s3_file' if respond_to?(:source_url)
issues_url 'https://github.com/meringu/remote_or_s3_file/issues' if respond_to?(:issues_url)
