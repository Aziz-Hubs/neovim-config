return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      api_key_cmd = "echo $GEMINI_API_KEY",
      api_host = "generativelanguage.googleapis.com",
      api_base = "/v1beta/models/",
      openai_params = {
        model = "gemini-pro",
      },
      openai_edit_params = {
        model = "gemini-pro",
      },
      -- START of new/corrected section
      build_curl_args = function(self, args, job)
        -- The default function sends the API key as a Bearer token,
        -- which is incorrect for Gemini. We need to build the command
        -- to use the 'x-goog-api-key' header instead.
        local cmd = { "curl" }
        local api_key = self:get_api_key()
        if not api_key or api_key == "" then
          self:err("API key not found")
          return
        end

        table.insert(cmd, "-X")
        table.insert(cmd, "POST")
        table.insert(cmd, "-H")
        table.insert(cmd, "Content-Type: application/json")
        table.insert(cmd, "-H")
        table.insert(cmd, "x-goog-api-key: " .. api_key) -- Correct header for Gemini
        table.insert(cmd, "-d")
        table.insert(cmd, vim.fn.shellescape(args.body))
        table.insert(cmd, args.url)

        return cmd
      end,
      -- END of new/corrected section
      api_chat_template = "%s:generateContent",
      api_edit_template = "%s:generateContent",
      build_chat_payload = function(self, query)
        return {
          contents = {
            { role = "user", parts = { { text = query } } },
          },
        }
      end,
      extract_chat_reply = function(self, reply)
        if
          reply
          and reply.candidates
          and #reply.candidates > 0
          and reply.candidates[1].content
          and reply.candidates[1].content.parts
          and #reply.candidates[1].content.parts > 0
        then
          return reply.candidates[1].content.parts[1].text
        end
      end,
    },
  },
}
