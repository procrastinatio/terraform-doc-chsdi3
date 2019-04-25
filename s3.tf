
// Website bucket

resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.website-bucket}"
  acl    = "public-read"
  force_destroy = false
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}


resource "aws_s3_bucket_policy" "releases-policy" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  policy =<<POLICY
{
  "Id": "Policy1513880777555",
  "Version": "2012-10-17",
"Statement": [
{
      "Sid": "Stmt1513880773845",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
            "${aws_s3_bucket.website_bucket.arn}",
            "${aws_s3_bucket.website_bucket.arn}/*"
       ],
"Principal": {
"AWS": [
          "${aws_iam_role.codepipeline_role.arn}"
        
]
      
}
    
}
  
]

}
POLICY

}

// Artifact bucket

resource "aws_s3_bucket" "artifacts_bucket" {
  bucket = "${var.artifacts-bucket}"
  acl    = "private"
  force_destroy = false
}


resource "aws_s3_bucket_policy" "website-policy" {
  bucket = "${aws_s3_bucket.artifacts_bucket.id}"
  policy =<<POLICY
{
  "Id": "Policy1513880777556",
  "Version": "2012-10-17",
"Statement": [
{
      "Sid": "Stmt1513880773846",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
            "${aws_s3_bucket.artifacts_bucket.arn}",
            "${aws_s3_bucket.artifacts_bucket.arn}/*"
       ],
"Principal": {
"AWS": [
          "${aws_iam_role.codepipeline_role.arn}"
]
}
}
]
}
POLICY

}
