import { on } from "ember-addons/ember-computed-decorators";
import { extendedEmojiList } from "pretty-text/emoji";
import { emojiUrlFor } from "discourse/lib/text";
import { findRawTemplate } from "discourse/lib/raw-templates";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default Ember.Component.extend({
  selected : null,
  selected_btn : null,
  disable_btn: true,

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
      this.set("selected",clicked_title);
      this.set("disable_btn", false);
    });
  },

  actions: {
    submitFeedback() {
      const selected_emoji = this.get("selected")
      console.log(selected_emoji);
      //Create a topic
      ajax(`/feedback/post_feedback`,
        {
          type: "GET",
          data: {
            selected_emoji: selected_emoji,
          }
        }).then(json => {
                      console.log("Done");
                    })
                    .catch(popupAjaxError);
      //Although this does the work, component is tightly coupled with the model functionality.
      //This issue will be addressed later
      this.parentView.parentView.attrs.closeModal();
    }
  }
});
