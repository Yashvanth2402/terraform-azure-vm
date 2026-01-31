# Good: Add more variables
variable "data_disk_size" {
  description = "Size of data disk in GB"
  type        = number
  default     = 64
  validation {
    condition     = var.data_disk_size >= 32 && var.data_disk_size <= 4096
    error_message = "Data disk size must be between 32GB and 4096GB."
  }
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "10.0.0.0/24"
}
