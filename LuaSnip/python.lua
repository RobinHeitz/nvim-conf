local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

  s(
    { trig = "rosnode", dscr = "A basic ros2 node implementation (python)" },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[

import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image


class <>(Node):

    def __init__(self):
        super().__init__("<>")

        # Publisher
        self.pub = self.create_publisher(Image, "/topic_to_publish_image", 10)

        # subscribers
        self.sub = self.create_subscription(Image, "/topic_to_sub_to", self.img_cb, 10)

        # services
        self.srv = self.create_service(
            MyService,
            "/service_name",
            self.service_cb,
        )

    def img_cb(self, msg):
        self.get_logger().debug("img_cb ...")
        self.img = msg
        self.destroy_subscription(self.img_sub)

    def service_cb(self, request, response):
        ...
        return response


def main(args=None):
    rclpy.init()
    node = <>()

    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
          ]],
      { i(1), i(2), rep(1) }
    )
  ),
}
