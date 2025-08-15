export default function handler(req, res) {
  res.status(200).json({
    message: "d06bfa8af5cc1e3df9e7",
    timestamp: new Date().toISOString(),
  });
}