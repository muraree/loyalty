require 'test_helper'

class BillControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should get new" do
    get new_bill_path
    assert_response :success
  end

  test "should get create with foreign_country when pass 100 amount" do
    user = users(:one)
    bill_params = { bill: {
                              user_id: user.id,
                              amount: 100,
                              foreign_country: true
                              }
                           }

    post bills_url(params: bill_params)

    assert_equal 100, Bill.last.amount
    assert_equal true, Bill.last.foreign_country
    assert_equal user.id, Bill.last.user_id
    assert_equal 20, Bill.last.user.points

  end

  test "should get create without foreign_country when pass 100 amount" do
    user = users(:one)
    bill_params = { bill: {
                              user_id: user.id,
                              amount: 100,
                              foreign_country: false
                              }
                           }

    post bills_url(params: bill_params)

    assert_equal 100, Bill.last.amount
    assert_equal false, Bill.last.foreign_country
    assert_equal user.id, Bill.last.user_id
    assert_equal 10, Bill.last.user.points

  end

end
