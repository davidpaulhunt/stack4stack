json.array!(@stacks) do |stack|
  json.extract! stack, :id
  json.url stack_url(stack, format: :json)
end
