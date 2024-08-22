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

  s(
    { trig = "roslaunch", dscr = "A basic ros2 python launch file" },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[
import os

from ament_index_python.packages import get_package_share_directory
from launch_ros.actions import Node

from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.conditions import IfCondition
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration


def generate_args():
    return [
        DeclareLaunchArgument(
            "launch_rviz", default_value="true", description="Whether to launch rviz."
        ),
    ]


def generate_launch_description():

    bringup_pkg = get_package_share_directory("lara_bringup")
    rviz_config_file = os.path.join(bringup_pkg, "rviz", "cam_launch.rviz")

    a_pkg_share = get_package_share_directory("disassembly_execution")
    a_launch_file = os.path.join(a_pkg_share, "launch", "my_launch.launch.py")
    launch_it = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(a_launch_file),
        launch_arguments={"rviz": "false"}.items(),
    )

    return LaunchDescription(
        [
            *generate_args(),
            launch_it,
            Node(
                package="",
                executable="",
                output="",
                name="",
                arguments=[
                    "--ros-args",
                    "--log-level",
                    "ERROR",
                ],
                parameters=[
                    {"some_param_value": ""},
                ],
            ),
            Node(
                condition=IfCondition(LaunchConfiguration("launch_rviz")),
                package="rviz2",
                executable="rviz2",
                output="screen",
                arguments=["-d", rviz_config_file],
            ),
            Node(
                package="tf2_ros",
                executable="static_transform_publisher",
                output="screen",
                arguments=[
                    "--frame-id",
                    "frameA",
                    "--child-frame-id",
                    "frameB",
                    "--yaw",
                    "-1.5708",
                ],
            ),
        ]
    )

          ]],
      {}
    )
  ),
}
