
## Background
1. EMC - is the vendor that provides Storage Appliances (think huge disks)
1. ECS - Elastic Cloud Storage (really large Storage Appliance) 
1. AWS S3 - Amazon Web Service Secure Simple Storage (AWS S3) - AWS was the first vendor to supply this type of storage. Hence, everyone emulates S3.

## What is EMC's ECS Object Store?
At the highest level, the Object Store is very simple. 
There are three nested hierarchical components: namespaces, buckets, objects

| Container | Description |
| ------ | ------ |
| namespace | The Object Store has many namespaces. Our namespace is **health-pharmacy**, every namespace has one or more **buckets** |
| bucket | A bucket is a container that has one or more **objects** |
| object | An object is a file or collection of files (think .zip or .rar or ...). We will operate at the object basis. Operations at the object level are simple, you do put()/get() of objects. |

## Ok, I get it ... how do I interact with the Object Store?
AWS was the first to make the Object Store popular. AWS coined the term S3. S3 aka, Simple Storage Service. you also hear 'Secure' and other S words, not really sure what the initial S3 was meant for, but just think Object Storage.

Usage of EMC ECS Storage is AWS S3 compatible storage device.

Most tools that work with AWS S3, *should* work with ECS storage.

We will be using the AWS CLI for most of the scripting/programatic interface. Amazon has an API First mindset. The CLI is the underlying so anything the CLI can do, the 

## Ok, now I understand what it is ... How do I connect up to it?
There are two components needed to read/write the Object Storage.
1. Credentials ... think login/password stored in a local file
1. Client side software. Can be done with any S3 compatible package or via AWS's CLI package.

Client software works for both Windows, MacOS, Linux .... we'll show examples using CLI since this is consistent across all three environments. GUI tools seem to be platform specific and for MacOS was a complete failure. Hence, I've adopted using the [AWS CLI toolset](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html).

## User interface / CLI Interface
There are many ways to manage the storage of data in S3. There are several GUI tools that can be used, I ran into a roadblock with MacOS, but the Windows GUI tools seem to work better.

### AWS CLI just works
I'm going to move forward with describing the AWS cli package. Without a doubt, this works on both MacOS/Windows. The freeware tools were fairly weak and caused me a lot of grief.

## Download AWS Cli package



```bash
For mac users:
$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"

for Win users:
$ curl https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html
```

## Install AWS cli package
```bash
For mac users:
$  installer -pkg AWSCLIV2.pkg -target /
for Win users:
$ curl
```

## AWS S3 and AWS CLI References
1. [AWS S3 Ref Page](https://docs.aws.amazon.com/cli/latest/reference/s3/index.html)
1. [AWS CLI Ref Page](https://docs.aws.amazon.com/cli/latest/reference/)

## Dell Reference pages/.pdf
1. [Dell/EMC Tagging ](https://www.delltechnologies.com/resources/en-us/asset/white-papers/products/storage-1/h14071-ecs-architectural-guide-wp.pdf)
1. [EMC alternative - object tagging](http://doc.isilon.com/ECS/3.5/API/S3ObjectTaggingOperations_ba672412ac371bb6cf4e69291344510e_overview.html)
1. [AWS PUT Tagging]
(https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html)
1. [AWS PUT Tagging as pdf]
(https://docs.aws.amazon.com/AmazonS3/latest/API/s3-api.pdf#API_PutObjectTagging)

