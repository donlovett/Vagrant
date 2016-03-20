# Vagrant
Vagrant items

This is an internal use project

The purpose is to create a linux web server using
  Vagrant for the vm creation
  puppet as the provisioning tool
  virtualbox as the vm provider
  
It has a few bits from several talented people who have solved this problem before me

It creates a ubuntu vm with an apache webserver

There is alos a download of severla puppet models including the NTP time protocal

To start this machine from my laptop running wihdows 7 I issue 
  vagrant up --provider=virtualbox
  
  This assumes a default network location of http://192.168.33.13/ for the web server
  
  
