import { on } from "ember-addons/ember-computed-decorators";
import { extendedEmojiList } from "pretty-text/emoji";
import { emojiUrlFor } from "discourse/lib/text";
import { findRawTemplate } from "discourse/lib/raw-templates";

export default Ember.Component.extend({
  selected : null,

  @on("didInsertElement")
  setBind() {
    const $emojiButtons = $(".emoji")
    $emojiButtons.on('click',(e) => {
      const clicked_title = e.currentTarget.title;
      if (this.selected) {
          $("[title='"+this.selected+"']").css("background-color","transparent");
      }
      $("[title='"+clicked_title+"']").css("background-color","lightblue");
      this.selected = clicked_title;
    });
  },
});
