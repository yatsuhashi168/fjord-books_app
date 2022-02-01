# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    alice = users(:Alice)
    bob = users(:Bob)
    report_a = reports(:report_a)
    assert report_a.editable?(alice)
    assert_not report_a.editable?(bob)
  end

  test "#created_on" do
    report_a = reports(:report_a)
    assert_equal report_a.created_at.to_date, report_a.created_on
    assert_not_equal report_a.created_at, report_a.created_on
  end
end
