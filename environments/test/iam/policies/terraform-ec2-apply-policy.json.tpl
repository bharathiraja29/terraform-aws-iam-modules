{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ModifyInstanceActions",
            "Effect": "Allow",
            "Action": [
                "ec2:DetachVolume",
                "ec2:AttachVolume",
                "ec2:RebootInstances",
                "ec2:TerminateInstances",
                "ec2:StartInstances",
                "ec2:StopInstances"
            ],
            "Resource": [
                "arn:aws:ec2:us-east-1:${account_id}:instance/*",
                "arn:aws:ec2:us-east-1:${account_id}:volume/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:ResourceTag/ApplicationName": "${tag_value}"
                }
            }
        },
        {
            "Sid": "RunInstances",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": "arn:aws:ec2:us-east-1:${account_id}:subnet/*",
            "Condition": {
                "StringEquals": {
                    "ec2:vpc": "arn:aws:ec2:us-east-1:${account_id}:vpc/vpc-5e409124"
                }
            }
        },
        {
            "Sid": "ReadAccess",
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:DescribeTags",
                "ec2:CreateKeyPair"
            ],
            "Resource": "*"
        },
        {
            "Sid": "ALlowTags",
            "Effect": "Allow",
            "Action": "ec2:CreateTags",
            "Resource": [
                "arn:aws:ec2:us-east-1:${account_id}:instance/*",
                "arn:aws:ec2:us-east-1:${account_id}:volume/*"
            ]
        },
        {
            "Sid": "OtherResourcesForInstanceLaunch",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:*:*:key-pair/*",
                "arn:aws:ec2:*:*:instance/*",
                "arn:aws:ec2:*::snapshot/*",
                "arn:aws:ec2:*:*:volume/*",
                "arn:aws:ec2:*:*:security-group/*",
                "arn:aws:ec2:*:*:network-interface/*",
                "arn:aws:ec2:*::image/*"
            ]
        }
    ]
}
