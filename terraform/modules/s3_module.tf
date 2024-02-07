resource "aws_s3_bucket" "website_bucket" {
  bucket = "module_bucket"

  # Enable static website hosting
  website {
    index_document = "index.html"
  }

  # Define bucket policy
  bucket_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      },
      {
        Sid       = "PublicWritePutObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:PutObject",
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
}

