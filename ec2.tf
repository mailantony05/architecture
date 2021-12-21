resource "aws_instance" "Jenkins_Master_Instance" {
  ami = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  key_name = "${aws_key_pair.jumpbox-key.id}"

  tags = {
    Name = "Jenkins_Master_Instance"
  }
}

resource "aws_instance" "Jenkins_Agent_Instance" {
  ami = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  key_name = "${aws_key_pair.jumpbox-key.id}"

  tags = {
    Name = "Jenkins_Agent_Instance"
  }
}

resource "aws_instance" "Deployment_Instance" {
  ami = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  key_name = "${aws_key_pair.jumpbox-key.id}"

  tags = {
    Name = "Deployment_Instance"
  }
}

/*
resource "aws_ebs_volume" "terraform_jenkins_ebs" {
  availability_zone = "ap-south-1a"
  snapshot_id = "snap-0cb18ef15f549b4b0"

  tags = {
    Name = "HelloWorld"
  }
}
*/

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "vol-0e9db3b2846532fd1"
  instance_id = "${aws_instance.Jenkins_Master_Instance.id}"
}

resource "aws_key_pair" "jumpbox-key" {
  key_name   = "jumpbox-key"
  public_key = "ssh-rsa 
  <SSH-Key Details>
}

