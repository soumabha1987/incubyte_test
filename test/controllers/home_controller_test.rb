require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get add_numbers with no input" do
    get add_numbers_url
    assert_response :success
    assert_select "p", text: /Result: 0/
  end

  test "should add comma separated numbers" do
    get add_numbers_url, params: { numbers: "11,2,3" }
    assert_response :success
    assert_select "p", text: /Result: 16/
  end

  test "should add newline separated numbers" do
    get add_numbers_url, params: { numbers: "1\n2\n35" }
    assert_response :success
    assert_select "p", text: /Result: 38/
  end

  test "should add mixed delimiters" do
    get add_numbers_url, params: { numbers: "4\n2,3" }
    assert_response :success
    assert_select "p", text: /Result: 9/
  end

  test "should handle any delimiter" do
    get add_numbers_url, params: { numbers: "19;2@3" }
    assert_response :success
    assert_select "p", text: /Result: 24/
  end

  test "should show error for negative numbers" do
    get add_numbers_url, params: { numbers: "1,-2,3" }
    assert_response :success
    assert_select "p", text: /Negative numbers not allowed: -2/
  end

  test "should show error for multiple negative numbers" do
    get add_numbers_url, params: { numbers: "-10,-2,3" }
    assert_response :success
    assert_select "p", text: /Negative numbers not allowed: -1, -2/
  end

  test "should handle input with \\n as string" do
    get add_numbers_url, params: { numbers: "43\\n2,3" }
    assert_response :success
    assert_select "p", text: /Result: 48/
  end

  test "should show error for negative number with special delimiters" do
    get add_numbers_url, params: { numbers: "\\2@45\n-31" }
    assert_response :success
    assert_select "p", text: /Negative numbers not allowed: -3/
  end
end