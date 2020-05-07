{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReadOnly",
            "Action": [
                "ec2:Describe*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Sid": "AllowOnlyLaunchWithTags",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateTags"
            ],
            "Resource": [
                "arn:aws:ec2:${region}:${account_id}:instance/*",
                "arn:aws:ec2:${region}:${account_id}:volume/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:CreateAction": "RunInstances"
                }
            }
        },
        {
            "Sid": "AllowActionsWithOnltTags",
            "Effect": "Allow",
            "Action": [
                "ec2:RebootInstances",
                "ec2:StopInstances",
                "ec2:TerminateInstances",
                "ec2:StartInstances",
                "ec2:AttachVolume",
                "ec2:DetachVolume"
            ],
            "Resource": [
                "arn:aws:ec2:${region}:${account_id}:instance/*",
                "arn:aws:ec2:${region}:${account_id}:volume/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:ResourceTag/ApplicationName": "XYZ"
                }
            }
        },
        {
            "Sid": "RemainingRunInstancePermissionsNonResource",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:${region}::image/*",
                "arn:aws:ec2:${region}::snapshot/*",
                "arn:aws:ec2:${region}:${account_id}*:network-interface/*",
                "arn:aws:ec2:${region}:${account_id}*:key-pair/*",
                "arn:aws:ec2:${region}:${account_id}*:security-group/*"
            ]
        },
        {
            "Sid": "EC2RunInstances",
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": "arn:aws:ec2:${region}:${account_id}:subnet/*",
            "Condition": {
                "StringEquals": {
                    "ec2:Vpc": "arn:aws:ec2:${region}:${account_id}:vpc/${vpc_id}"
                }
            }
        }
    ]
}
