import { on } from "ember-addons/ember-computed-decorators";
import { extendedEmojiList } from "pretty-text/emoji";
import { emojiUrlFor } from "discourse/lib/text";
import { findRawTemplate } from "discourse/lib/raw-templates";

export default Ember.Component.extend({
  selected : null,
  selected_btn : null,

  @on("didInsertElement")
  setBind() {
    const $emojiButtons = $(".emoji")
    $emojiButtons.on('click',(e) => {
      const clicked_title = e.currentTarget.title;
      if (this.selected_btn) {
          this.selected_btn.css("background-color","transparent");
      }
      this.selected_btn = $("[title='"+clicked_title+"']");
      this.selected_btn.css("background-color","lightblue");
      this.selected = clicked_title;
    });
  },
});
