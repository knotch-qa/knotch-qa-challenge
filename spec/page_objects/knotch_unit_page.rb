require "spec_helper"
require_relative "knotch_unit_iframe"

class KnotchUnitPage < SitePrism::Page
  set_url "https://www.knotch-cdn.com/standalone/unit.html?id=9f8c92ce-b11f-411c-80f6-a59f6f877d8e"

  element :iframe_element, :xpath, '//iframe[@title="Feedback Question By Knotch"]'
  element :powered_by_knotch, "#poweredByKnotch"

  iframe :question_iframe, KnotchUnitIframe, :xpath, '//iframe[@title="Feedback Question By Knotch"]'
end
