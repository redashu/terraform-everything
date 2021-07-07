provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "mygrp" {
	name = "${var.name}"
	location = "${var.location1}"

}
