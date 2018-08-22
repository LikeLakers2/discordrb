# API calls for Invite object
module Discordrb::API::Invite
  module_function

  # Resolve an invite
  # @return [RestClient::Response] the API response
  # @see https://discordapp.com/developers/docs/resources/invite#get-invite
  def resolve(token, invite_code, counts = true)
    Discordrb::API.request(
      :invite_code,
      nil,
      :get,
      "#{Discordrb::API.api_base}/invite/#{invite_code}#{counts ? '?with_counts=true' : ''}",
      Authorization: token
    )
  end

  # Delete an invite by code
  # @return [RestClient::Response] the API response
  # @see https://discordapp.com/developers/docs/resources/invite#delete-invite
  def delete(token, code, reason = nil)
    Discordrb::API.request(
      :invites_code,
      nil,
      :delete,
      "#{Discordrb::API.api_base}/invites/#{code}",
      Authorization: token,
      'X-Audit-Log-Reason': reason
    )
  end

  # Join a server using an invite
  # @return [RestClient::Response] the API response
  def accept(token, invite_code)
    Discordrb::API.request(
      :invite_code,
      nil,
      :post,
      "#{Discordrb::API.api_base}/invite/#{invite_code}",
      nil,
      Authorization: token
    )
  end
end
