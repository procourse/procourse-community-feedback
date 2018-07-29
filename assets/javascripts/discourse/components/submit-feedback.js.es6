import { on } from "ember-addons/ember-computed-decorators";
import { extendedEmojiList } from "pretty-text/emoji";
import { emojiUrlFor } from "discourse/lib/text";
import { findRawTemplate } from "discourse/lib/raw-templates";

export default Ember.Component.extend({

  @on("didInsertElement")
  setEmojies() {
    this.set();
  },
});
