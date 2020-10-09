require 'spec_helper'
require_relative '../page_objects/knotch_unit_page'

RSpec.feature 'Knotch Unit spec', :type => :feature do
  let(:knotch_unit_page)      { KnotchUnitPage.new }
  let(:unselected_bar_height) { "matrix(1, 0, 0, 1, 0, 421.4)" }
  let(:tall_bar_height)       { "matrix(1, 0, 0, 1, 0, 172)" }
  let(:mid_bar_height)        { "matrix(1, 0, 0, 1, 0, 258)" }
  let(:neutral_bar_height)    { "matrix(1, 0, 0, 1, 0, 344)" }

  context 'on the Knotch Unit page' do
    background do
      knotch_unit_page.load
    end

    scenario 'hovering over the Knotch Unit options shows correct options and correct bar heights' do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible
      expect(knotch_unit_page.powered_by_knotch).to be_visible
      knotch_unit_page.question_iframe do |frame|
        expect(frame.instructions).to be_visible
        expect(frame.question_text).to be_visible
        frame.question_text.hover

        # WebDriver's element height attribute doesn't return the correct animated bar size,
        # so we use the CSS transformation style to verify that the bars have the correct height.
        # the fixed browser size (1024x768) keeps the transform values consistent.

        expect(frame.extremely_negative_bar.style("transform")["transform"]).to eql(unselected_bar_height)
        expect(frame.negative_bar.style("transform")["transform"]).to eql(unselected_bar_height)
        expect(frame.neutral_bar.style("transform")["transform"]).to eql(unselected_bar_height)
        expect(frame.positive_bar.style("transform")["transform"]).to eql(unselected_bar_height)
        expect(frame.extremely_positive_bar.style("transform")["transform"]).to eql(unselected_bar_height)

        frame.extremely_positive_option.hover
        expect(frame.extremely_positive_bar.style("transform")["transform"]).to eql(tall_bar_height)
        expect(frame.option_sentence).to have_text("Extremely Positive")

        frame.positive_option.hover
        expect(frame.positive_bar.style("transform")["transform"]).to eql(mid_bar_height)
        expect(frame.option_sentence).to have_text("Positive")

        frame.neutral_option.hover
        expect(frame.neutral_bar.style("transform")["transform"]).to eql(neutral_bar_height)
        expect(frame.option_sentence).to have_text("Neutral")

        frame.negative_option.hover
        expect(frame.negative_bar.style("transform")["transform"]).to eql(mid_bar_height)
        expect(frame.option_sentence).to have_text("Negative")

        frame.extremely_negative_option.hover
        expect(frame.extremely_negative_bar.style("transform")["transform"]).to eql(tall_bar_height)
        expect(frame.option_sentence).to have_text("Extremely Negative")
      end
    end

  scenario 'keyboard navigation for the Knotch Unit options shows appropriate values' do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible

      # check that frame has loaded before keyboard navigation

      knotch_unit_page.question_iframe do |frame|
        expect(frame.instructions).to be_visible
        expect(frame.question_text).to be_visible
      end

      knotch_unit_page.iframe_element.send_keys :tab
      knotch_unit_page.question_iframe do |frame|
        expect(frame.option_sentence).to have_text("Extremely Negative")
      end

      knotch_unit_page.iframe_element.send_keys :tab
      knotch_unit_page.question_iframe do |frame|
        expect(frame.option_sentence).to have_text("Negative")
      end

      knotch_unit_page.iframe_element.send_keys :tab
      knotch_unit_page.question_iframe do |frame|
        expect(frame.option_sentence).to have_text("Neutral")
      end

      knotch_unit_page.iframe_element.send_keys :tab
      knotch_unit_page.question_iframe do |frame|
        expect(frame.option_sentence).to have_text("Positive")
      end

      knotch_unit_page.iframe_element.send_keys :tab
      knotch_unit_page.question_iframe do |frame|
        expect(frame.option_sentence).to have_text("Extremely Positive")
      end
    end

    scenario "selecting Extremely Negative shows 'Doom' output" do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible

      knotch_unit_page.question_iframe do |frame|
        expect(frame.question_text).to be_visible
        frame.question_text.hover
        frame.extremely_negative_option.hover
        expect(frame.option_sentence).to have_text("Extremely Negative")
        frame.extremely_negative_option.click
        expect(frame.thanks_message).to have_text("Maybe Try Doom!")
      end
    end

    scenario "selecting Negative shows 'Doom' output" do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible

      knotch_unit_page.question_iframe do |frame|
        expect(frame.question_text).to be_visible
        frame.question_text.hover
        frame.negative_option.hover
        expect(frame.option_sentence).to have_text("Negative")
        frame.negative_option.click
        expect(frame.thanks_message).to have_text("Maybe Try Doom!")
      end
    end

    scenario "selecting Neutral shows 'Give it another shot' output" do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible

      knotch_unit_page.question_iframe do |frame|
        expect(frame.question_text).to be_visible
        frame.question_text.hover
        frame.neutral_option.hover
        expect(frame.option_sentence).to have_text("Neutral")
        frame.neutral_option.click
        expect(frame.thanks_message).to have_text("Give it another shot!")
      end
    end

    scenario "selecting Positive shows 'Great ty' output" do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible

      knotch_unit_page.question_iframe do |frame|
        expect(frame.question_text).to be_visible
        frame.question_text.hover
        frame.positive_option.hover
        expect(frame.option_sentence).to have_text("Positive")
        frame.positive_option.click
        expect(frame.thanks_message).to have_text("Great ty!")
      end
    end

    scenario "selecting Extremely Positive shows 'Great ty' output" do
      expect(knotch_unit_page).to be_displayed
      expect(knotch_unit_page.iframe_element).to be_visible

      knotch_unit_page.question_iframe do |frame|
        expect(frame.question_text).to be_visible
        frame.question_text.hover
        frame.extremely_positive_option.hover
        expect(frame.option_sentence).to have_text("Extremely Positive")
        frame.extremely_positive_option.click
        expect(frame.thanks_message).to have_text("Great ty!")
      end
    end
  end
end
