require "spec_helper"

class KnotchUnitIframe < SitePrism::Page
  element :instructions, "span", text: "Hover mouse anywhere. Click to submit."
  element :question_text, "span", text: "How do you feel about Animal Crossing?"
  element :option_sentence, "#sentence"
  element :thanks_message, ".thanksMessage"
  element :extremely_positive_option, :xpath, "//button[@aria-labelledby='label_4']"
  element :positive_option, :xpath, "//button[@aria-labelledby='label_3']"
  element :neutral_option, :xpath, "//button[@aria-labelledby='label_2']"
  element :negative_option, :xpath, "//button[@aria-labelledby='label_1']"
  element :extremely_negative_option, :xpath, "//button[@aria-labelledby='label_0']"
  element :extremely_negative_bar, ".bar.color_0"
  element :negative_bar, ".bar.color_1"
  element :neutral_bar, ".bar.color_2"
  element :positive_bar, ".bar.color_3"
  element :extremely_positive_bar, ".bar.color_4"
end
