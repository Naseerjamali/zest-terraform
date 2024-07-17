variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
  default     = "asia-south1"
}

variable "public" {
  description = "Whether the bucket is public or not."
  type        = bool
  default     = false
}





# variable "buckets" {
#     description = "storage buckets" 
#     type = list(object({
#         name = string
#         location = string
#         storage_class = string
#         uniform_bucket_level_access = bool
#         role = string
#         entity = string

#         #object_name = string
#         #content = string
#     }))
# }