search-internet
===============

Launches a browser and navigates to a search engine passing in search terms from a selection

## Installation

### Lazy
```lua
  {
    'andres-lowrie/nvim-search-internet',
    config = function()
      vim.keymap.set({ 'n' }, '<Leader>si', require('search-internet').selection, { desc = "[S]earch [I]nternet" })
      vim.keymap.set({ 'n' }, '<Leader>sw', require('search-internet').word_under_cursor,
        { desc = "[S]earch Internet for [W]ord under cursor" })
    end
  }
```
