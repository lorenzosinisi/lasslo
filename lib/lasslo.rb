require "lasslo/version"

class Lasslo

  SYLLABLES = %w(ba be bi bo bu by da de di do du dy fe fi fo fu fy ga ge gi
    go gu gy ha he hi ho hu hy ja je ji jo ju jy ka ke ko ku ky la le li lo
    lu ly ma me mi mo mu my na ne ni no nu ny pa pe pi po pu py ra re ri ro
    ru ry sa se si so su sy ta te ti to tu ty va ve vi vo vu vy bra bre bri
    bro bru bry dra dre dri dro dru dry fra fre fri fro fru fry gra gre gri
    gro gru gry pra pre pri pro pru pry sta ste sti sto stu sty tra tre er
    ed in ex al en an ad or at ca ap el ci an et it ob of af au cy im op co
    up ing con ter com per ble der cal man est for mer col ful get low son
    tle day pen pre ten tor ver ber can ple fer gen den mag sub sur men min
    out tal but cit cle cov dif ern eve hap ket nal sup ted tem tin tro tro)

  def initialize
    srand
  end

  def self.generate(length)
    result = ''
    while result.length < length
      syl = SYLLABLES[rand(SYLLABLES.length)]
      result += syl
    end
    result = result[0,length]
    # Stick in a digit
    dpos = rand(length)
    result[dpos,1] = rand(9).to_s
    # Make a letter capitalized
    cpos = rand(length)
    result[cpos,1] = result[cpos,1].swapcase
    return result
  end

  def self.unique(length, model_ref)
    unique_password = ""
    model_ref = model_ref.to_s
    method_is = defined?(model_ref.constantize)
    raise "Model not defined, is #{model_ref} a Model?" if method_is != "method"
    the_model = model_ref.constantize
    while true
       unique_password = generate(length)
       break if the_model.where(:password => unique_password).first.blank?
    end
    return unique_password
  end

  def self.unique_encrypted(length, model_ref)
    unique_password = ""
    model_ref = model_ref.to_s
    method_is = defined?(model_ref.constantize)
    raise "Model not defined, is #{model_ref} a Model?" if method_is != "method"
    the_model = model_ref.constantize
    while true
       unique_password = generate(length)
       break if the_model.where(:password => unique_password).first.blank?
    end
    encripted = [unique_password].pack("u")
    return encripted
  end

  def self.decrypt(password)
    return password.unpack("u")
  end

  def self.encrypt(password)
    return [password].pack("u")
  end
end
