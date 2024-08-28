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
    { trig = "roscmake", dscr = "A snip to add cmake for a given rosnode name in cpp." },
    fmta( -- the snippet code actually looks like the equation environment it produces.
      [[

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

# Include header directory
include_directories(include)

# Install header files
install(DIRECTORY include/
  DESTINATION include/
)

# Declare the executable and link necessary libraries
add_executable(<> src/<>.cpp)
ament_target_dependencies(<> rclcpp std_msgs)

install(TARGETS <> 
  DESTINATION lib/${PROJECT_NAME}
)
target_compile_features(<> PUBLIC c_std_99 cxx_std_17)  # Require C99 and C++17
          ]],
      { i(1), rep(1), rep(1), rep(1), rep(1) }
    )
  ),
}
