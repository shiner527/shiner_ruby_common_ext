# frozen_string_literal: true

#
# 扩展 Array 类
#
class Array # :nodoc:
  #
  # 找到数组中为空的元素，并将去掉空元素的结果返回为一个新数组。空的定义由 +blank?+ 方法确定。本方法<b>不会改变</b>数组自身。
  #
  # @return [Array] 返回不包含空元素的数组作为结果。
  #
  def compact_blank
    result = []
    each { |item| result << item if item.present? }
    result
  end

  #
  # 去掉空元素并将去掉后的数组作为结果返回。空的定义由 +blank?+ 方法确定。本方法<b>会改变</b>数组自身。
  #
  # @return [Array] 返回不包含空元素的数组作为结果。
  #
  def compact_blank!
    delete_if(&:blank?)
  end
end
