# frozen_string_literal: true

#
# 时间类型相关类通用实例方法定义模块。
#
# @author shiner<shiner@hotmail.com>
#
module TimeInstance
  #
  # 时间格式化为指定的字符串。
  #
  # @param [Symbol] type 指定需要转换的具体格式。默认为 +:date+ 类型的格式。
  #
  # @return [String] 返回转换后的字符串。
  #
  def format_date(type = :date)
    case type
    when :full
      strftime('%Y-%m-%d %H:%M:%S')
    when :min
      strftime('%Y-%m-%d %H:%M')
    when :date
      strftime('%Y-%m-%d')
    when :year
      strftime('%Y')
    end
  end
end

#
# 扩展 Date 类
#
class Date # :nodoc:
  include ::TimeInstance
end

#
# 扩展 Time 类
#
class Time # :nodoc:
  include ::TimeInstance
end

#
# 扩展 DateTime 类
#
class DateTime # :nodoc:
  include ::TimeInstance
end
