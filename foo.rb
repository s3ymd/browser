def partitions(elem, pred)
    return [elem] if pred.empty?
    match, rest = elem.partition(&pred.shift)
    [match, *partitions(rest, pred)]
end

elem = Object.constants.map{|c|[c, Object.const_get(c)]}
ex,cl,mo,etc = partitions(elem, [
    ->(pair){pair[1].is_a?(Class) && pair[1] < Exception}, # 例外クラス
    ->(pair){pair[1].is_a?(Class)}, # 通常クラス
    ->(pair){pair[1].is_a?(Module)} # モジュール
])

class Methods
    # 対象のクラス
    # public/protected/private
    # 継承したものかどうか
    # 大文字で始まるか
    # ? / ! で終わるか
    # 破壊的バージョンと通常バージョン両方が定義されているか?
    # to_で始まるか?
    # スーパークラスのメソッドをオーバーライドしているか?
    # rails由来のメソッドか？
end

def partition_method(mod)
    elem = mod.private_methods(false)
    ms = partitions(elem, [
        ->(m){m =~ /^[A-Z]/},
        ->(m){m[-1] == '?'},
        ->(m){m[-1] == '!'},
        ->(m){m =~ /^to_/},
        ->(m){m =~ /^\W+$/},
    ])
end


p ms[0]