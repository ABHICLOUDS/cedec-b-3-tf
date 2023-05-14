# variable os{
# default="linux"
# }

# variable cloud{
# default="AWS"
# }

# variable learn{
# default="DevOPs"
# }

variable "username" {
  type = list(string)
  default = ["tucker","annie","josh"]
}