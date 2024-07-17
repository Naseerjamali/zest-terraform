
resource "google_storage_bucket" "public_bucket" {
  name     = var.bucket_name #"my-public-bucket"
  location = var.location
  force_destroy = true
  soft_delete_policy {
    retention_duration_seconds = 0
  }
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "all_users_legacy_reader" {
  for_each = var.public ? toset(["allUsers"]) : toset([])

  bucket = google_storage_bucket.public_bucket.name
  role   = "roles/storage.legacyObjectReader"
  member =  each.key  #"allUsers"
}




# resource "google_storage_bucket" "bucket" {
#   count = length(var.buckets)
#   name          = var.buckets[count.index].name #"new-bucket"
#   location      = var.buckets[count.index].location #"asia-south1"
#   storage_class = var.buckets[count.index].storage_class#"STANDARD"

#   soft_delete_policy {
#     retention_duration_seconds = 0
#   }

#   uniform_bucket_level_access =  var.buckets[count.index].uniform_bucket_level_access #true

# }

# # Make bucket public by granting allUsers READER access
# resource "google_storage_object_access_control" "public_rule" {
#   count = length(var.buckets)
#   bucket = google_storage_bucket.bucket[count.index].id
#   role   = var.buckets[count.index].role #"READER"
#   entity = var.buckets[count.index].entity #"allUsers"
#   object = google_storage_bucket_object.image[count.index].name
# }

# resource "google_storage_bucket_object" "image" {
#   count = length(var.buckets)
#   name   = var.buckets[count.index].name
#   bucket = google_storage_bucket.bucket[count.index].id
#   content = var.buckets[count.index].content
# }