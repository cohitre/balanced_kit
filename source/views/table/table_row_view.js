import StaticTextView from "balanced/views/static_text_view";

var generateCellContents = function(cell) {
  if (Ember.typeOf(cell) === "string") {
    return StaticTextView.create({
      text: cell
    });
  }
  else {
    return cell;
  }
};

var TableRowView = Ember.ContainerView.extend({
  tagName: "tr",
});

TableRowView.reopenClass({
  createForCells: function(cellsArray, cellAttributes) {
    var children = Ember.A(cellsArray)
      .map(generateCellContents)
      .map(function(cell) {
        var attr = Ember.merge({
          tagName: "td",
          childViews: [cell]
        }, cellAttributes);
        return Ember.ContainerView.create(attr);
      });

    return this.create({
      childViews: children
    });
  }
});

export {TableRowView};
export default TableRowView;
