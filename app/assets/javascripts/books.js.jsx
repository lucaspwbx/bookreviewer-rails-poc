/** @jsx React.DOM */
var Book = React.createClass({
  render: function() {
    return (
      <div className='book'>
        <h2>
          Name: {this.props.name}
          Pages: {this.props.pages}
          Language: {this.props.language}
        </h2>
      </div>
    );
  }
});

var BookList = React.createClass({
  render: function() {
    var books = this.props.books.map(function(book, index) {
      return (<Book name={book.name} pages={book.pages} language={book.language} key={index} />);
    });

    return (
      <div className='booksList'>
        {books}
      </div>
    );
  }
});

var ready = function() {
  var books = [
    { name: "Teste", pages: "10", language: "English" },
    { name: "Dummies", pages: "90", language: "Deutsch" }
  ];

  React.renderComponent(
    <BookList books={books}/>, document.getElementById('books')
  );
};

$(document).ready(ready);
