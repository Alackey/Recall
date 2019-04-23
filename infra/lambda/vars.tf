variable "region" {
  description = "specifies aws region"
  default     = "us-west-2"
}

variable "artifact_bucket" {
  description = "the bucket for fetching the artifact"
  default     = "recall-lambda-artifacts"
}

variable "artifact_zip_name_reminder" {
  description = "name of the reminder zip file"
  default     = "reminder.zip"
}

variable "functions_file_name_getReminder" {
  description = "the file that contains the getReminder lambda function"
  default     = "getReminder"
}

