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
    { trig = "rosnodecpp", dscr = "A basic ros2 node implementation (python)" },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[

#include "tool_calibration/tool_calibration.hpp"

$?::$?()
: Node("$?")
{
    prefix_ = "Processed: ";

    // Create the subscriber
    subscriber_ = this->create_subscription<std_msgs::msg::String>(
        "input_topic", 10,
        std::bind(&$?::subscriberCallback, this, std::placeholders::_1)
    );

    // Create the publisher
    publisher_ = this->create_publisher<std_msgs::msg::String>("output_topic", 10);
    RCLCPP_INFO(this->get_logger(), "$?has been started.");
}

void $?::subscriberCallback(const std_msgs::msg::String::SharedPtr msg)
{
    RCLCPP_INFO(this->get_logger(), "Received message: '%s'", msg->data.c_str());
    std::string processed_message = processMessage(msg->data);
    publishMessage(processed_message);
}

void $?::publishMessage(const std::string &message)
{
    auto msg = std_msgs::msg::String();
    msg.data = message;
    publisher_->publish(msg);
    RCLCPP_INFO(this->get_logger(), "Published message: '%s'", message.c_str());
}

std::string $?::processMessage(const std::string &message)
{
    return prefix_ + message;
}

int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<$?>());
    rclcpp::shutdown();
    return 0;
}
          ]],
      { i(1), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1) },
      { delimiters = "$?" }
    )
  ),

  s(
    { trig = "rosinclude", dscr = "A include example for ros2 cpp node" },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[

#ifndef EXAMPLE_NODE_HPP_
#define EXAMPLE_NODE_HPP_

#include <<rclcpp/rclcpp.hpp>>
#include <<std_msgs/msg/string.hpp>>

class <>: public rclcpp::Node
{
public:
    <>();

private:
    void subscriberCallback(const std_msgs::msg::String::SharedPtr msg);
    void publishMessage(const std::string &message);
    std::string processMessage(const std::string &message);

    rclcpp::Subscription<<std_msgs::msg::String>>::SharedPtr subscriber_;
    rclcpp::Publisher<<std_msgs::msg::String>>::SharedPtr publisher_;

    std::string prefix_;
};

#endif


          ]],
      { i(1), rep(1) }
    )
  ),
}
