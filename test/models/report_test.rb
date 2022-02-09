# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    bob = users(:bob)
    report_a = reports(:alice_report)
    assert report_a.editable?(alice)
    assert_not report_a.editable?(bob)
  end

  test '#created_on' do
    report_a = reports(:alice_report)
    assert_equal Date.today, report_a.created_on
  end
end
