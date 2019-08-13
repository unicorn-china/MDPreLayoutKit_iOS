
Pod::Spec.new do |s|
  s.name             = 'MDPreLayoutKit'
  s.version          = '1.0.0'
  s.summary          = '默认状态布局'

  s.description      = <<-DESC
    网络数据接收完成前的布局
                       DESC
  s.homepage         = 'https://github.com/unicorn-china/MDPreLayoutKit_iOS.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iyongjie@yeah.net' => 'yj.li@muheda.com' }
  s.source           = { :git => 'https://github.com/unicorn-china/MDPreLayoutKit_iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'MDPreLayoutKit/**/*'

end
