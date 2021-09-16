# frozen_string_literal: true

#
# 扩展 Array 类
#
class Hash # :nodoc:
  #
  # 找到散列中键值对的值为空的元素，并将去掉这样的键值对的结果返回为一个新散列。空的定义由 +blank?+ 方法确定。本方法<b>不会改变</b>散列自身。
  #
  # @return [Array] 返回不包含键值对中值为空元素的散列作为结果。
  #
  def compact_blank
    result = {}
    each { |k, v| result[k] = v if v.present? }
    result
  end

  #
  # 去掉散列中键值对的值为空的键值对，并将去掉后的散列作为结果返回。空的定义由 +blank?+ 方法确定。本方法<b>会改变</b>散列自身。
  #
  # @return [Array] 返回不包含键值对中值为空元素的散列作为结果。
  #
  def compact_blank!
    delete_if { |_k, v| v.blank? }
  end
end
