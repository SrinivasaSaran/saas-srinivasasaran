def equalise_weights(input)
  weights = input.map { |weight| weight[1][:individual_weights] }
  for k in 1..input.length - 1
    if weights[k - 1].sum == weights[k].sum
      return minweights.map { |m| m.sort }.sort
    else
      a = weights[k - 1].each_with_index.min
      b = weights[k].each_with_index.min
      weights[k - 1][a[1]] = b[0]
      weights[k][b[1]] = a[0]
      k = k - 1
    end
  end
end

def swap(weight_1, weight_2)
  a = weight_1.each_with_index.min
  b = weight_2.each_with_index.min
  weight_1[a[1]] = b[0]
  weight_2[b[1]] = a[0]
end

input = { "1" => { :items_in_bag => 1, :individual_weights => [35] }, "2" => { :items_in_bag => 2, :individual_weights => [40, 5] } }
print equalise_weights(input)
