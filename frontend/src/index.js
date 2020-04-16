import React from 'react'
import ReactDOM from 'react-dom'
import './index.css'
const axios = require('axios');

class BuildItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      receivedItems: []
    };
  }

  componentDidMount() {
    let currentComponent = this;
      axios.get("http://192.168.1.65:3001/api/" + this.props.platform.toLowerCase())
      .then(function (response) {
        currentComponent.setState({
          isLoaded: true,
          receivedItems: response.data
        })
      })
      .catch(function (error) {
        console.log(error);
      });
  }

  render() {
    const { error, isLoaded, receivedItems } = this.state;
    if (error) {
      return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      var versionNumbers = new Set()
      receivedItems.map(item => (
        versionNumbers.add(item.version)
      ))
      var versionNumbersArray = Array.from(versionNumbers.values());
      var completeList = []
      versionNumbersArray.forEach(function(versionNumber) {
        var objectList = []
        receivedItems.forEach(function(receivedItem) {
          if(versionNumber === receivedItem.version) {
            objectList.push(receivedItem)
          }
        })
        completeList.push({
          items: objectList
        })
      });
      return (
        <div>
        <h1 className="platform"> Builds for {this.props.platform}</h1>
          {completeList.map(((version) => (
            <div>
              <h3 className="version">{version["items"][0].version}</h3>
              <ul>
              {version["items"].map(((item, i) => (
                <li><a href={item.url} key={i}>
                  {item.name}
                </a><br/></li>
              )))}
            </ul>
          </div>
          )))}
        </div>
      );
    }
  }
}

class Builds extends React.Component {
  renderBuilds(platform) {
    return <BuildItem platform={platform}/>;
  }

  state = {
    displayIOS: false,
    displayAndroid: false
  }

  render() {
   return (
    <div className="Nav">
      <div className="Button-Container">
        <button className="platform" onClick={() => this.setState({ displayIOS: true, displayAndroid: false }) }>iOS</button>
        <button className="platform" onClick={() => this.setState({ displayAndroid: true , displayIOS: false }) }>Android</button>
      </div>
      { this.state.displayIOS ? this.renderBuilds("iOS") : null}
      { this.state.displayAndroid ? this.renderBuilds("Android") : null}
    </div>
    );
   }
}

ReactDOM.render(
  <Builds />,
  document.getElementById('root')
);
